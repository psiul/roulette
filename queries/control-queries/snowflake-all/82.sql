select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,date_dim d,ship_mode sm
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and cd.cd_hash >= 289 and cd.cd_hash <= 689 and d.d_hash >= 15 and d.d_hash <= 765 and sm.sm_hash >= 48 and sm.sm_hash <= 381
;
