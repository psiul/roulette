select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 180 and d.d_hash <= 930 and hd.hd_hash >= 147 and hd.hd_hash <= 547 and cd.cd_hash >= 221 and cd.cd_hash <= 554
;
