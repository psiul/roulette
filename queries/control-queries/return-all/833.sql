select count(ws.ws_item_sk)
from web_sales ws,web_returns wr,household_demographics hd,customer_demographics cd,item i
where ws.ws_order_number = wr.wr_order_number and wr.wr_returning_hdemo_sk = hd.hd_demo_sk and ws.ws_bill_cdemo_sk = cd.cd_demo_sk and ws.ws_item_sk = i.i_item_sk and hd.hd_hash >= 164 and hd.hd_hash <= 497 and cd.cd_hash >= 147 and cd.cd_hash <= 547 and i.i_hash >= 83 and i.i_hash <= 833
;
