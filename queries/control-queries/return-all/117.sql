select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,customer c,customer_demographics cd,reason r
where ws.ws_order_number = wr.wr_order_number and ws.ws_bill_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and wr.wr_reason_sk = r.r_reason_sk and ws.ws_hash >= 288 and ws.ws_hash <= 621 and c.c_hash >= 179 and c.c_hash <= 579 and cd.cd_hash >= 160 and cd.cd_hash <= 910
;
