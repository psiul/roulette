select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 377 and d.d_hash <= 777 and cd.cd_hash >= 149 and cd.cd_hash <= 899 and hd.hd_hash >= 146 and hd.hd_hash <= 479
;
