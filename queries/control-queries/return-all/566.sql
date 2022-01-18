select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,ship_mode sm,customer c
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and d.d_hash >= 248 and d.d_hash <= 581 and sm.sm_hash >= 90 and sm.sm_hash <= 840 and c.c_hash >= 583 and c.c_hash <= 983
;
