select count(ws.ws_item_sk)
from web_sales ws,date_dim d,ship_mode sm,customer c,customer_demographics cd
where ws.ws_ship_date_sk = d.d_date_sk and ws.ws_ship_mode_sk = sm.sm_ship_mode_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 489 and d.d_hash <= 822 and c.c_hash >= 192 and c.c_hash <= 592 and cd.cd_hash >= 216 and cd.cd_hash <= 966
;
