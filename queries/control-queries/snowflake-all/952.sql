select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,date_dim d,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and sm.sm_hash >= 340 and sm.sm_hash <= 740 and cd.cd_hash >= 55 and cd.cd_hash <= 805 and i.i_hash >= 242 and i.i_hash <= 575
;
