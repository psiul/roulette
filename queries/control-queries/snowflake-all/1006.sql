select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,date_dim d
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_sold_date_sk = d.d_date_sk and c.c_hash >= 542 and c.c_hash <= 942 and hd.hd_hash >= 1 and hd.hd_hash <= 751 and d.d_hash >= 615 and d.d_hash <= 948
;
