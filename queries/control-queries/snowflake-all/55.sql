select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer c,customer_demographics cd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 3 and d.d_hash <= 336 and sm.sm_hash >= 333 and sm.sm_hash <= 733 and c.c_hash >= 157 and c.c_hash <= 907
;
