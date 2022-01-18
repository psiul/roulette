select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 190 and ss.ss_hash <= 940 and hd.hd_hash >= 253 and hd.hd_hash <= 653 and cd.cd_hash >= 462 and cd.cd_hash <= 795
;
