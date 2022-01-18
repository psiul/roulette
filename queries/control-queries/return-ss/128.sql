select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and hd.hd_hash >= 584 and hd.hd_hash <= 984 and d.d_hash >= 654 and d.d_hash <= 987
;
