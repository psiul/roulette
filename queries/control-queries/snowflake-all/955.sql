select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,warehouse w,item i,customer_demographics cd
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_warehouse_sk = w.w_warehouse_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and sm.sm_hash >= 407 and sm.sm_hash <= 740 and i.i_hash >= 151 and i.i_hash <= 901 and cd.cd_hash >= 428 and cd.cd_hash <= 828
;
