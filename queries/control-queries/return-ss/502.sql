select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 156 and d.d_hash <= 489 and cd.cd_hash >= 211 and cd.cd_hash <= 961 and hd.hd_hash >= 101 and hd.hd_hash <= 501
;
