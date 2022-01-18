select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 55 and ss.ss_hash <= 388 and i.i_hash >= 95 and i.i_hash <= 845 and hd.hd_hash >= 416 and hd.hd_hash <= 816
;
