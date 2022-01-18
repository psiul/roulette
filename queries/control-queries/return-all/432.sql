select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,store_returns sr,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 19 and cd.cd_hash <= 769 and hd.hd_hash >= 246 and hd.hd_hash <= 646 and d.d_hash >= 129 and d.d_hash <= 462
;
