select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,household_demographics hd,date_dim d
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and ws.ws_hash >= 422 and ws.ws_hash <= 755 and cd.cd_hash >= 1 and cd.cd_hash <= 401 and c.c_hash >= 76 and c.c_hash <= 826
;
