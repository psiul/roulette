select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 214 and ss.ss_hash <= 614 and d.d_hash >= 78 and d.d_hash <= 828 and cd.cd_hash >= 384 and cd.cd_hash <= 717
;
