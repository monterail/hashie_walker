require "spec_helper"

describe HashieWalker do
  let(:hash) {
    { "One" => 1, "Two" => 2 }
  }

  let(:array_of_hashes) {
    [ { "One" => 1, "Two" => 2 }, { "Three" => 3, "Four" => 4 } ]
  }

  let(:nested_hash) {
    { "Hash" => { "One" => 1, "Two" => 2 }, "Array" => [ { "One" => 1, "Two" => 2 }, { "Three" => 3, "Four" => 4 } ] }
  }

  let(:downcase_keys) {
    lambda { |on|
      on.key { |key| key.downcase }
    }
  }

  let(:square_values) {
    lambda { |on|
      on.value { |value| value * value }
    }
  }

  let(:downcase_keys_and_square_values) {
    lambda { |on|
      on.key { |key| key.downcase }
      on.value { |value| value * value }
    }
  }

  it "should return unchanged object when providing no block" do
    HashieWalker.walk(hash).should == hash
  end

  it "should walk through hash and transform keys" do
    result = HashieWalker.walk(hash, &downcase_keys)
    result.should == { "one" => 1, "two" => 2 }
  end

  it "should walk through hash and transform values" do
    result = HashieWalker.walk(hash, &square_values)
    result.should == { "One" => 1, "Two" => 4 }
  end

  it "should walk through hash and transform keys and values" do
    result = HashieWalker.walk(hash, &downcase_keys_and_square_values)
    result.should == { "one" => 1, "two" => 4 }
  end

  it "should walk through array of hashes and transform keys and values" do
    result = HashieWalker.walk(array_of_hashes, &downcase_keys_and_square_values)
    result.should == [ { "one" => 1, "two" => 4 }, { "three" => 9, "four" => 16 } ]
  end

  it "should walk through nested hash and transform keys and values" do
    result = HashieWalker.walk(nested_hash, &downcase_keys_and_square_values)
    result.should == { "hash" => { "one" => 1, "two" => 4 }, "array" => [ { "one" => 1, "two" => 4 }, { "three" => 9, "four" => 16 } ] }
  end
end
