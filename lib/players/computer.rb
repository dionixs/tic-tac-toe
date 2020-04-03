# frozen_string_literal: true

module Players
  class Computer < Player
    def initialize(params)
      super(params)
      @game = params[:game]
      @name = :computer
      @board = @game.board
      @enemy = @game.human
      @ai = AI.new(@game, @enemy, self)
    end

    def position
      if @board.empty_cells.size == 9
        @board.empty_cells.sample
      else
        @ai.minimax(@board, self)
        @ai.best_move
      end
    end

    def move(board)
      index = position
      board.fill_cell(index, @token) unless board.cell_taken?(index)
    end
  end
end
