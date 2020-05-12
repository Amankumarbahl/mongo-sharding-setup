rs.initiate();
cfg = {
  _id: 'rs1',
  members: [
    { _id: 0, host: 'mongo-rs1-1:27017' },
    { _id: 1, host: 'mongo-rs1-2:27018' },
    { _id: 2, host: 'mongo-rs1-3:27019' }
  ]
};
cfg.protocolVersion = 1;
rs.reconfig(cfg, { force: true });
