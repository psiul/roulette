select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 527 and ss.ss_hash <= 927 and i.i_hash >= 67 and i.i_hash <= 817 and hd.hd_hash >= 350 and hd.hd_hash <= 683
;
