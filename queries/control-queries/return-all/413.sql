select count(ws.ws_item_sk)
from web_sales ws,date_dim d,customer_demographics cd,web_returns wr,household_demographics hd
where ws.ws_sold_date_sk = d.d_date_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_order_number = wr.wr_order_number and ws.ws_bill_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 223 and d.d_hash <= 556 and cd.cd_hash >= 16 and cd.cd_hash <= 766 and hd.hd_hash >= 226 and hd.hd_hash <= 626
;
