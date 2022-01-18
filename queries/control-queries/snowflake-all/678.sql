select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,item i,customer_demographics cd
where ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_hash >= 557 and ws.ws_hash <= 890 and c.c_hash >= 58 and c.c_hash <= 808 and hd.hd_hash >= 223 and hd.hd_hash <= 623
;
