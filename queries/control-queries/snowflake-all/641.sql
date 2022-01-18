select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,date_dim d,item i
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_item_sk = i.i_item_sk and cd.cd_hash >= 72 and cd.cd_hash <= 405 and d.d_hash >= 178 and d.d_hash <= 928 and i.i_hash >= 309 and i.i_hash <= 709
;
