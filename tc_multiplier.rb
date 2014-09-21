require_relative "multiplier"
require "test/unit"
 
class TestMultiplier < Test::Unit::TestCase
 
    def setup
        @multiplier = Multiplier.new
        assert_equal([2], @multiplier.primes)
        assert_equal([], @multiplier.table)
        assert_equal(10, @multiplier.n)
    end
    
    def test_nprime
        @multiplier.nprimes
        assert_equal(@multiplier.primes.length, @multiplier.n)
    end
    def test_multiply
        @multiplier.multiply
        t = @multiplier.table
        assert_kind_of(Array, t[0])
        t.each_with_index do |row,ri|
            row.each_with_index do |col,ci|
                if ri > 0 && ci > 0
                    assert_kind_of(Array,row)
                    assert_kind_of(Fixnum,col) #this is a string in t[0][0]
                    assert_kind_of(Fixnum,ri)
                    assert_kind_of(Fixnum,ci)
                    assert_equal(col, t[ri][0]*t[0][ci])
                end
            end
        end
    end
    
    def test_zero
        @multiplier_zero = Multiplier.new(0)
        assert_equal([], @multiplier_zero.primes)
        assert_equal([], @multiplier_zero.table)
        assert_equal(0, @multiplier_zero.n)
    end
    
    def test_upper
        @multiplier_upper = Multiplier.new(1000)
        assert_equal([2], @multiplier_upper.primes)
        assert_equal([], @multiplier_upper.table)
        assert_equal(1000, @multiplier_upper.n)
        @multiplier_upper.nprimes
        assert_equal(7919, @multiplier_upper.primes.last)
        assert_equal(1000, @multiplier_upper.primes.length)
        @multiplier_upper.multiply
        assert_equal(7919*7919, @multiplier_upper.table.last.last)
    end    
 
end