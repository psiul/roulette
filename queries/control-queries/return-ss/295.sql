select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 298 and ss.ss_hash <= 698 and d.d_hash >= 101 and d.d_hash <= 851 and hd.hd_hash >= 480 and hd.hd_hash <= 813
;
