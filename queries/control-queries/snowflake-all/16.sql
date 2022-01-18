select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,ship_mode sm,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 357 and ws.ws_hash <= 757 and d.d_hash >= 257 and d.d_hash <= 590 and c.c_hash >= 129 and c.c_hash <= 879
;
