rs.initiate();
cfg = {
   _id: 'rsc',
   configsvr: true,
   members: [
      { _id: 0, host: "mongo-rsc-1:27017" },
      { _id: 1, host: "mongo-rsc-2:27018" },
      { _id: 2, host: "mongo-rsc-3:27019" }
   ]
};
cfg.protocolVersion = 1;
rs.reconfig(cfg, { force: true });


