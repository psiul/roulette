select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer_demographics cd,date_dim d,customer c
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_hash >= 475 and ws.ws_hash <= 875 and sm.sm_hash >= 74 and sm.sm_hash <= 407 and cd.cd_hash >= 175 and cd.cd_hash <= 925
;
