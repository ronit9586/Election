pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Election {
    struct Candidate {
        uint cnt;
        string name;
    }
    Candidate[] public candidates;
    mapping(address => bool) isVoted;
    address owner;

    event CandidateAdd(string _candidate);
    event Voted(uint id, string _candidate, uint voteCount);

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(address _owner) public {
        owner = _owner;
    }

    function addCandidate(string memory _candidate) public onlyOwner {
        candidates.push(Candidate(0, _candidate));
        emit CandidateAdd(_candidate);
    }

    function vote(uint index) public {
        require(index < candidates.length && !isVoted[msg.sender]);
        candidates[index].cnt++;
        isVoted[msg.sender] = true;
        emit Voted(index, candidates[index].name, candidates[index].cnt);
    }

    function totalCandidate() public view returns(uint) {
        return candidates.length;
    }

    function getCandidate() public view returns (Candidate[] memory) {
       
        return candidates;
    }


}