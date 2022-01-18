select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 356 and ss.ss_hash <= 756 and hd.hd_hash >= 205 and hd.hd_hash <= 955 and i.i_hash >= 382 and i.i_hash <= 715
;
