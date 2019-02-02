require('./helpers/setup');
const  { encodeRequestCall } = require("./helpers/encodeCall");

const RequestFactoryRegistry = artifacts.require('RequestFactoryRegistry');
const RequestFulfillerRegistry = artifacts.require('RequestFulfillerRegistry');
const ConfigureRequestFactory = artifacts.require('ConfigureRequestFactory');
const InitializeRequestFactory = artifacts.require('InitializeRequestFactory');
const RequestManager = artifacts.require('RequestManager');
const ConfigureRequest = artifacts.require('ConfigureRequest');
const FulfillTarget = artifacts.require('FulfillTarget');
const FulfillConfigure = artifacts.require('FulfillConfigure');

const CONFIGURE = web3.utils.fromAscii('configure');
const INITIALIZE = web3.utils.fromAscii('initialize');

contract('RequestFlow', accounts => {
    beforeEach(async () => {
        this.rfactoryRegistry = await RequestFactoryRegistry.new();
        this.configureRequestFactory = await ConfigureRequestFactory.new(this.rfactoryRegistry.address);
        this.initializeRequestFactory = await InitializeRequestFactory.new(this.rfactoryRegistry.address);
        this.fulfillTarget = await FulfillTarget.new();
        this.rfulfillerRegistry = await RequestFulfillerRegistry.new();
        this.fulfillConfigure = await FulfillConfigure.new(this.fulfillTarget.address, this.rfulfillerRegistry.address);
        this.requestManager = await RequestManager.new(this.rfactoryRegistry.address, this.rfulfillerRegistry.address);
    });

    it('should be ok', async () => {
        const _stoTimeArgs = [1, 2, 3, 4];
        const _stoInvestmentArgs = [5, 6, 7, 8];
        let bytes = encodeRequestCall(["uint256[4]", "uint256[4]"], [_stoTimeArgs, _stoInvestmentArgs]);

        const factory = await this.rfactoryRegistry.getRequestFactory(CONFIGURE);

        await this.requestManager.createRequest(CONFIGURE, bytes);
        
        const request = await this.requestManager.getRequest(0);
        this.configureRequest = await ConfigureRequest.at(request);
        const details = await this.configureRequest.getDetails();
        console.log(details);
        await this.requestManager.fulfillRequest(0);

        const fulfillTargetDetails = await this.fulfillTarget.getDetails();
        console.log(fulfillTargetDetails);
    });
});