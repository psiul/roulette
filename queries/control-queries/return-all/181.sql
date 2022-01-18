select count(ws.ws_item_sk)
from web_sales ws,customer c,household_demographics hd,customer_demographics cd,web_returns wr
where ws.ws_bill_customer_sk = c.c_customer_sk and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_hash >= 185 and ws.ws_hash <= 518 and hd.hd_hash >= 227 and hd.hd_hash <= 977 and cd.cd_hash >= 513 and cd.cd_hash <= 913
;
