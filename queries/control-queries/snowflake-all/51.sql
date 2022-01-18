select count(ws.ws_item_sk)
from web_sales ws,ship_mode sm,customer c,customer_demographics cd,date_dim d
where ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 358 and ws.ws_hash <= 691 and sm.sm_hash >= 119 and sm.sm_hash <= 519 and d.d_hash >= 134 and d.d_hash <= 884
;
