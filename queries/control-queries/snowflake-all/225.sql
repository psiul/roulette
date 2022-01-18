select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,date_dim d,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_ship_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 401 and c.c_hash <= 801 and hd.hd_hash >= 10 and hd.hd_hash <= 760 and cd.cd_hash >= 218 and cd.cd_hash <= 551
;
