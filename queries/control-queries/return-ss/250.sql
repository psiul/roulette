select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 307 and ss.ss_hash <= 707 and hd.hd_hash >= 20 and hd.hd_hash <= 770 and cd.cd_hash >= 420 and cd.cd_hash <= 753
;
