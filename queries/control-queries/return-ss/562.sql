select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 619 and ss.ss_hash <= 952 and d.d_hash >= 197 and d.d_hash <= 947 and cd.cd_hash >= 33 and cd.cd_hash <= 433
;
