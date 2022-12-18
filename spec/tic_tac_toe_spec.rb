# frozen_string_literal: true

require './script'

describe Game do
  describe '#check_for_winner' do
    context 'when winning places are taken by a player' do
      it 'game is over (winner is announced)' do
        player = 'o'
        subject.instance_variable_set(:@board, "\n\t  o | o | o \n\t --- --- ---\n\t  x | x | 6 \n\t --- --- ---\n\t  7 | 8 | 9 \n\n")
        allow(subject).to receive(:announce_game_over).with(player)
        expect(subject).to receive(:announce_game_over).with(player)
        subject.check_for_winner(player)
      end
    end
  end

  describe '#create_players' do
    context "when player1 is set to 'o'" do
      it "player2 sets automatically to 'x'" do
        allow(subject).to receive(:create_player_one).and_return('o')
        subject.create_players
        player2 = subject.instance_variable_get(:@player2)
        expect(player2).to eq('x')
      end
    end
  end

  describe '#create_player_one' do
    context 'when player1 is set to a valid value' do
      it 'stops loop and does not display error message' do
        allow(subject).to receive(:gets).and_return('o')
        subject.create_player_one
        expect(subject).not_to receive(:print).with('Invalid choice. Try again (Choose your letter: o / x): ')
      end
    end
  end

  describe '#round(player)' do
    before do
      spec_helper_suppress_output
    end

    context 'when player inputs a valid board position' do
      it 'does not display error message' do
        allow(subject).to receive(:gets).and_return('1')
        player1 = 'o'
        subject.round(player1)
        expect(subject).not_to receive(:print).with('Invalid choice. Try again: ')
      end

      it "inserts player's symbol on the board" do
        allow(subject).to receive(:gets).and_return('6')
        player1 = 'o'
        subject.round(player1)
        board = subject.instance_variable_get(:@board)
        expect(board[40]).to eq('o')
      end
    end
  end
end
