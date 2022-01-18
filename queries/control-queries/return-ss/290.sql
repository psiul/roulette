select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 104 and ss.ss_hash <= 854 and d.d_hash >= 308 and d.d_hash <= 708 and hd.hd_hash >= 630 and hd.hd_hash <= 963
;
