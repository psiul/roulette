select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,customer c,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_hash >= 134 and ws.ws_hash <= 884 and cd.cd_hash >= 155 and cd.cd_hash <= 488 and c.c_hash >= 152 and c.c_hash <= 552
;
