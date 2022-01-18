select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 543 and ss.ss_hash <= 876 and d.d_hash >= 137 and d.d_hash <= 537 and hd.hd_hash >= 236 and hd.hd_hash <= 986
;
