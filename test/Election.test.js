const ElectionContract = artifacts.require("Election.sol");

contract("Election", (accounts) => {
    let elecationInstance;
    let [alice, bob, ronit] = accounts;
    beforeEach(async () => {
        elecationInstance = await ElectionContract.new(alice);
    })

    it("owner alice add client", async ()=>{
        try {
            await elecationInstance.addCandidate("Modi", {from: alice});
            let can = await elecationInstance.candidates(0);
            assert.equal(can.name.toString(), "Modi");
        }catch(err){
            console.log(err);
            assert.equal(true,false);
        }

    })

    
});