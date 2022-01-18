select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,item i,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 383 and ss.ss_hash <= 783 and hd.hd_hash >= 14 and hd.hd_hash <= 764 and i.i_hash >= 297 and i.i_hash <= 630
;
