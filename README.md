# Cryver - Cryptocurrency Job Market

This project was developed for ETHWaterloo 2019 with team members: Eric Lau, Eric Wang, Nourish Cherish, and Cengiz Sirlan. The project's aim is to provide the best experince/alternative to paying freelancers for work using the power of crypto. Many popular freelance websites dont have much protection from freelancers and buyers from not being faithful, as such Cryver fixes this concern by creating a checkpoint system where the buyer set milestones that the freelancer must complete in order to earn segments of the promised pay, this way in order for the buyer to get the product they want and the freelancer to get the money they want, they both must continue to fulfill their promises. Aside from acccountability, Cryver also provides a way to pay freelancers with crypto without the concern of price volitity by using stablecoins such as TCAD or USDC. This way when a buyer and seller agree on a price, and even if the development time has taken an extended period of time, there would not be much concern for increased or decreased market value of the payment when the job is completed.

### Protype webpage

Homepage
![mainpage](/images/mainpage.jpg)
What buyer sees when looking at project status
![assign](/images/assign.jpg)
What freelancer see when looking at project status
![job](/images/job.jpg)

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
