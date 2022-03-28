#!/bin/bash
set -e

echo "::set-output name=line_covered::$(xmllint --xpath "string(/report/counter[@type='LINE']/@covered)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=line_missed::$(xmllint --xpath "string(/report/counter[@type='LINE']/@missed)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=instruction_covered::$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@covered)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=instruction_missed::$(xmllint --xpath "string(/report/counter[@type='INSTRUCTION']/@missed)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=branch_covered::$(xmllint --xpath "string(/report/counter[@type='BRANCH']/@covered)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=branch_missed::$(xmllint --xpath "string(/report/counter[@type='BRANCH']/@missed)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=method_covered::$(xmllint --xpath "string(/report/counter[@type='METHOD']/@covered)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=method_missed::$(xmllint --xpath "string(/report/counter[@type='METHOD']/@missed)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=class_covered::$(xmllint --xpath "string(/report/counter[@type='CLASS']/@covered)" build/reports/kover/project-xml/report.xml)"
echo "::set-output name=class_missed::$(xmllint --xpath "string(/report/counter[@type='CLASS']/@missed)" build/reports/kover/project-xml/report.xml)"