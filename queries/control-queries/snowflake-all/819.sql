select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 28 and ws.ws_hash <= 428 and d.d_hash >= 144 and d.d_hash <= 477 and cd.cd_hash >= 65 and cd.cd_hash <= 815
;
