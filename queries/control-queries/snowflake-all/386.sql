select count(ws.ws_item_sk)
from web_sales ws,customer_demographics cd,customer c,household_demographics hd,item i
where ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ws.ws_item_sk = i.i_item_sk and cd.cd_hash >= 273 and cd.cd_hash <= 606 and c.c_hash >= 10 and c.c_hash <= 760 and hd.hd_hash >= 233 and hd.hd_hash <= 633
;
