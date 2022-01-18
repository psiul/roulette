select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and ws.ws_hash >= 3 and ws.ws_hash <= 403 and cd.cd_hash >= 122 and cd.cd_hash <= 455 and d.d_hash >= 84 and d.d_hash <= 834
;
