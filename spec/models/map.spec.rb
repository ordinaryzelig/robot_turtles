require_relative 'helper'

describe Map do

  let(:map_str) do
    <<-END
0   ; 1     ; 2 ; 3 ; 4 ; 5  ; 6; 7;
T0N ; I     ; C ; P ; W ; J1 ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ;       ;   ;   ;   ;    ;  ;  ;
    ; T2E,P ;   ;   ;   ;    ;  ;  ;
    END
      .gsub(' ', '')
      .lines[1..-1]
      .map(&:chomp)
      .join
  end

  it 'represents each space on the board and its tile mapping' do
    board = Map.new(map_str).board

    board.space_at(0,0).tiles.map(&:to_map).must_equal ['T0N']
    board.space_at(0,1).tiles.map(&:to_map).must_equal ['I']
    board.space_at(0,2).tiles.map(&:to_map).must_equal ['C']
    board.space_at(0,3).tiles.map(&:to_map).must_equal ['P']
    board.space_at(0,4).tiles.map(&:to_map).must_equal ['W']
    board.space_at(0,5).tiles.map(&:to_map).must_equal ['J1']
    board.space_at(7,1).tiles.map(&:to_map).must_equal ['T2E', 'P']

    board.space_at(1,0).tiles.must_be_empty
  end

end
