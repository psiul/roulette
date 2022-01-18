select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer c,ship_mode sm,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 79 and d.d_hash <= 412 and c.c_hash >= 318 and c.c_hash <= 718 and cd.cd_hash >= 147 and cd.cd_hash <= 897
;
