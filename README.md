# Job Market

### Demo videos
Front end built with React - https://www.youtube.com/watch?v=_aWNCsyIz1Q
Back end built with Solidity - https://www.youtube.com/watch?v=2XQ1xH-Hlqw

### Personas
- Payer - The person who wants to pay a freelancer to complete a job
- Freelancer - The person who wants to do a job to receive stablecoin

### Contracts
- JobMarket - The main contract controlling the market.
- Job - A payer adds a job that they want someone to do.
- Checkpoint - A specific milestone as part of a job, which is payable to the freelancer upon completion and acceptance by the payer.
- Token - An existing stablecoin such as TCAD or USDC.

### Contract flow
```
Payer:
Create Token (for demo purposes), store tokenAddress
Create JobMarket
Call JobMarket.setTokenAddress(tokenAddress)
Call JobMarket.createJob(name, description) — store jobAddress
Retrieve Job at jobAddress
Call Job.addCheckpoint(description, bounty) - store checkpointAddress from event
Retrieve Checkpoint at checkpointAddress
Call Token.approve(checkpointAddress, fundAmount)
Call Checkpoint.fund(fundAmount) which where fundAmount >= bounty

Freelancer:
Retrieve Checkpoint at checkpointAddress
Call Checkpoint.complete(url)

Payer:
Call Checkpoint.approve() --> fund gets transferred to Freelancer's account
```
