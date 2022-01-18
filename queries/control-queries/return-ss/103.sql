select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 163 and ss.ss_hash <= 913 and d.d_hash >= 420 and d.d_hash <= 753 and hd.hd_hash >= 167 and hd.hd_hash <= 567
;
