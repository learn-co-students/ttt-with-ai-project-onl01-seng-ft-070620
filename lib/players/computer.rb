

module Players

  class Computer < Player

    WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    def move(board)
      if board.turn_count == 0
        board.update("5", self)
        return "5"
      end
      fill_spot = -1
      WIN_COMBINATIONS.each{|combo|
        if board.position(combo[0] + 1) == board.position(combo[1] + 1) || board.position(combo[2] + 1) == board.position(combo[1] + 1) || board.position(combo[0] + 1) == board.position(combo[2] + 1)
          #Identifies a setup if it exists
          taken_spots = combo.select{|num| num if board.taken?(num + 1)}
          if taken_spots.length == 2
            if combo.select{|num| board.position(num)}.include?(self.token)
            number = (combo.select{|num| num if board.position(num +1) == " "}[0] + 1).to_s
            board.update(number, self)
            return number
            end
            fill_spot = (combo.select{|num| num if board.position(num +1) == " "}[0] + 1).to_s
          end
        end
      }
      if fill_spot != -1
        board.update(fill_spot, self)
        return fill_spot
      end
      corners = [0, 2, 6, 8]
      best_corner = 0
      most_wins = 0
      current_wins = 0
      corners.each{|corner|
        current_wins = 0
        WIN_COMBINATIONS.each{|combo|
          if combo.include?(corner) && !board.taken?(corner + 1)
            spaces_in_combo = combo.collect{|num| board.position(num + 1)}
            if spaces_in_combo.all?(" ")
              current_wins += 1
            elsif spaces_in_combo.all?{|space| space == " " || space == self.token}
              current_wins += 2
            end
          end
        }
        if current_wins >= most_wins && !board.taken?(corner + 1)
          most_wins = current_wins
          best_corner = corner
        end
      }
      number = (best_corner + 1).to_s
      if !corners.all?{|corner| board.taken?(corner + 1)}
        board.update(number, self)
        return number
      else
        sides = ["2", "4", "6", "8"]

        sides.each{|side|
          if board.valid_move?(side)
            board.update(side, self)
            return side
          end
          }
      end

    end

  end

end
