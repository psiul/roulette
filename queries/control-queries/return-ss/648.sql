select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,store_returns sr
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 50 and ss.ss_hash <= 800 and hd.hd_hash >= 281 and hd.hd_hash <= 614 and d.d_hash >= 7 and d.d_hash <= 407
;
